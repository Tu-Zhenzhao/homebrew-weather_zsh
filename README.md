# Weather Script in zsh

## Description

Weather_zsh is a Shell Script for displaying the current weather conditions in terminal. 

![Demo](/Users/tzz/Documents/weather_script/demo_weather.png)

**Weather data from the `openweathermap` weather API**

## Requirements

Check the list below before you run weather_zsh:

- Few commands in terminal `curl`, `date`
- [jq](https://stedolan.github.io/jq/)

## Installation

Using Home-brew to install it is the recommend way if you are using macOS or Linux:

```zsh
$ brew tap Tu-Zhenzhao/homebrew-weather_zsh
$ brew install homebrew-weather_zsh
```



Or you can do it manually by cloning the repository. After cloning the repo, you need to go to the directory in terminal and run:

```zsh
./weather
```

## Usage

### Synopsis

```zsh
weather [-n Name_of_Location]
				[-z ZIP_Code]
				[-d City_ID]
```

### Options

```zsh
-n location
				name of the location
-z zip_code
				zip code of your address
-d city_id
				you are required to find your city id from the website below
```

Check City ID: [City ID](http://bulk.openweathermap.org/sample/)

## API

Weather_zsh is using [OpenWeatherMap](https://openweathermap.org) free api. You can simply sign up on OpenWeatherMap to get a free api of weather.

```zsh
api_key:b50d1dba4625702a06311efea7a4ca0c
```

## License

Weather_zsh is licensed by `MIT Licence` 

## Author

Weather_zsh is developed by Zhenzhao Tu.

