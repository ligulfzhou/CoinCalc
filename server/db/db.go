package database

import (
	"github.com/jinzhu/gorm"
	_ "github.com/jinzhu/gorm/dialects/mysql"
	"time"
)

type Model struct {
	CreateTime time.Time `json:"create_time"`
	UpdateTime time.Time `json:"update_time"`
}

type UserCoin struct {
	//Model

	Id     int    `json:"id" sql:"AUTO_INCREMENT" gorm:"primary_key" db:"ad"`
	User   string `json:"user"                 gorm: "size:64"`
	Symbol string `json:"symbol"		       gorm: "size:64"`
	Name   string `json:"name"		           gorm: "size:64"`
	Cnt    string `json:"cnt"		           gorm: "size:32"`
}

func (uc *UserCoin) TableName() string {
	return "user_coin"
}

type Coin struct {
	Id     int    `json:"id" sql:"AUTO_INCREMENT" gorm:"primary_key" db:"ad"`
	Name   string `json:"name"		           gorm: "size:64"`
	Symbol string `json:"symbol"		       gorm: "size:64"`
}

func (c *Coin) TableName() string {
	return "coin"
}

type DB struct{}

func (db *DB) GetDBInstace() (*gorm.DB, error) {
	dtb, err := gorm.Open("mysql", "root:MYSQLzhouligang153@/xcoin?charset=utf8&parseTime=True&loc=Local")
	return dtb, err
}

func (db *DB) GetUserCoins(user string) []UserCoin {
	dtb, _ := db.GetDBInstace()
	defer dtb.Close()

	coins := []UserCoin{}
	dtb.Where("user = ?", user).Find(&coins)
	return coins
}

func (db *DB) SetUserCoin(user string, symbol string, name string, count string) UserCoin {
	dtb, err := db.GetDBInstace()
	defer dtb.Close()

	uc := UserCoin{}
	if err != nil {
		return uc
	}

	dtb.Where("user = ? AND symbol = ? AND name = ?", user, symbol, name).Find(&uc)
	if uc.Symbol != "" {
		uc.Cnt = count
		dtb.Save(&uc)
	} else {
		uc.Cnt = count
		uc.Symbol = symbol
		uc.User = user
		uc.Name = name
		dtb.Create(&uc)
	}
	return uc
}

func (db *DB) DeleteUserCoin(user string, symbol string, name string) {
	dtb, err := db.GetDBInstace()
	if err != nil {
		return
	}
	defer dtb.Close()

	dtb.Where("user = ? AND symbol = ? AND name = ?", user, symbol, name).Delete(&UserCoin{})
	return
}

func (db *DB) SearchCoin(name string) []Coin {
	coins := []Coin{}
	dtb, err := db.GetDBInstace()
	if err != nil {
		return coins
	}

	dtb.Where("name like ?", "%"+name+"%").Or("symbol like ?", "%"+name+"%").Find(&coins)
	return coins
}
