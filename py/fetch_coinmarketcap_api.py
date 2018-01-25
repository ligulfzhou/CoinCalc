# python3 fetch_coinmarketcap_api.py
import json
import redis
import asyncio
import aiohttp

class APIBase:

    def __init__(self, loop):
        self.loop = loop
        self.sem = asyncio.Semaphore(value=10)

    async def get(self, *args, **kwargs):
        async with self.sem:
            async with aiohttp.ClientSession(loop=self.loop) as session:
                async with session.get(*args, **kwargs) as resp:
                    return await resp.json()


class CoinMarcketCap(APIBase):

    def __init__(self, loop):
        super(CoinMarcketCap, self).__init__(loop)
        self.rs = redis.StrictRedis(host='127.0.0.1')

    def get_coin_range_key(self):
        return 'coins'

    def get_coin_x_key(self, symbol, name):
        return 'coin_%s_%s' % (symbol, name)

    async def fetch_coins(self):
        url = 'https://api.coinmarketcap.com/v1/ticker/?limit=0'
        coins = await self.get(url)
        print('coin leng: %s' % len(coins))

        key = self.get_coin_range_key()
        self.rs.delete(key)

        coinids = ['%s_%s' % (i['symbol'], i['name']) for i in coins]
        self.rs.rpush(key, *coinids)

        for coin in coins:
            print('iterate coin: %s' % coin['symbol'])
            k = self.get_coin_x_key(coin['symbol'], coin['name'])
            coin.update({
                'percent_change_one_day': coin['percent_change_24h'] or '',
                'percent_change_one_hour': coin['percent_change_1h'] or '',
                'percent_change_one_week': coin['percent_change_7d'] or ''
            })
            for i in ('percent_change_24h', 'percent_change_1h', 'percent_change_7d'):
                del coin[i]
            self.rs.set(k, json.dumps(coin))


    async def start(self):
        await self.fetch_coins()

if __name__ == '__main__':
    loop = asyncio.get_event_loop()
    cmc = CoinMarcketCap(loop)
    loop.run_until_complete(cmc.start())

