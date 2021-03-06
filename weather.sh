#! /bin/zsh


#assign variables
####IP=$(curl "ipinfo.io/json" | jq '.ip')
IP=$(curl "ipinfo.io/json")
ip_adr=$(echo $IP | jq -r '.ip')
city=$(echo $IP | jq -r '.city')
country=$(echo $IP | jq -r '.country')
timezone=$(echo $IP | jq -r '.timezone')
zip=$(echo $IP | jq -r '.postal')

#setting flag options
while getopts "n:z:d:" arg; do
  case $arg in
    n) Name=$OPTARG;;
		z) Zip=$OPTARG;;
		d) Id=$OPTARG;;
  esac
done

#variables for local weather
out_local=$(curl "https://api.openweathermap.org/data/2.5/weather?zip=$zip&appid=b50d1dba4625702a06311efea7a4ca0c&units=metric" -s)
test_out_local=$(echo $out_local | jq -r '.cod')

#variables for input city name
#name=$(curl "https://api.openweathermap.org/data/2.5/weather?q=$Name&appid=b50d1dba4625702a06311efea7a4ca0c&units=metric" -s)
#test_name=$(echo $name | jq -r '.cod')

#variables for input zip code
#zip_code=$(curl "https://api.openweathermap.org/data/2.5/weather?zip=$Zip&appid=b50d1dba4625702a06311efea7a4ca0c&units=metric" -s)
#test_zip_code=$(echo $zip_code | jq -r '.cod')

#variables for input address id
#id_address=$(curl "https://api.openweathermap.org/data/2.5/weather?id=$Id&appid=b50d1dba4625702a06311efea7a4ca0c&units=metric" -s)
#test_id_address=$(echo $id_address | jq -r '.cod')

#test which flags has been activated
[  -z "$Name" ] && Name="Empty" || name=$(curl "https://api.openweathermap.org/data/2.5/weather?q=$Name&appid=b50d1dba4625702a06311efea7a4ca0c&units=metric" -s)

[  -z "$Zip" ] && Zip="Empty" || zip_code=$(curl "https://api.openweathermap.org/data/2.5/weather?zip=$Zip&appid=b50d1dba4625702a06311efea7a4ca0c&units=metric" -s)
 
[  -z "$Id" ] && Id="Empty" || id_address=$(curl "https://api.openweathermap.org/data/2.5/weather?id=$Id&appid=b50d1dba4625702a06311efea7a4ca0c&units=metric" -s)


#print icon related to the code
icon=$(echo "$out_local" | jq -r '.weather[0].icon')

if [ "$Name" != "Empty" ]
then 
				icon=$(echo "$name" | jq -r '.weather[0].icon')
fi

if [ "$Zip" != "Empty" ]
then 
				icon=$(echo "$zip_code" | jq -r '.weather[0].icon')
fi

if [ "$Id" != "Empty" ]
then 
				icon=$(echo "$id_address" | jq -r '.weather[0].icon')
fi


if [ "$icon" = "01d" ]
then 
				icon="?????? "
fi 

if [ "$icon" = "01n" ]
then
				icon="????"
fi 

if [ "$icon" = "02d" ]
then
				icon="??????"
fi

if [ "$icon" = "02d" ]
then
				icon="????"
fi

if [ "$icon" = "03d" ]
then
				icon="?????? "
fi

if [ "$icon" = "03n" ]
then
				icon="?????? "
fi

if [ "$icon" = "04d" ]
then
				icon="?????? ????"
fi

if [ "$icon" = "04n" ]
then
				icon="?????? ????"
fi

if [ "$icon" = "09d" ]
then
				icon="????"
fi

if [ "$icon" = "09n" ]
then
				icon="????"
fi

if [ "$icon" = "10d" ]
then
				icon="????"
fi

if [ "$icon" = "10n" ]
then
				icon="????"
fi

if [ "$icon" = "11d" ]
then
				icon="????"
fi

if [ "$icon" = "11n" ]
then
				icon="????"
fi

if [ "$icon" = "13d" ]
then
				icon="?????? "
fi

if [ "$icon" = "13n" ]
then
				icon="?????? "
fi

if [ "$icon" = "50d" ]
then
				icon="????"
fi

if [ "$icon" = "50n" ]
then
				icon="????"
fi

#assign degree_sgin
degree_sgin=$'\xc2\xb0'


#print final info
if [ "$Name" != "Empty" ]
then
				test_name=$(echo $name | jq -r '.cod')
				if [ "$test_name" = 200 ]
				then
								###location info
								Location=$(echo $name | jq -r '.name')
								Country=$(echo $name | jq -r '.sys.country')
								location="Location: $Location, $Country"
								###weather icon info
								Icon="Weather Icon: $icon"
								###weather description
								Description=$(echo $name | jq -r '.weather[0].description')
								description="Weather Description: $Description"
								###temperature right now
								Temp=$(echo $name | jq -r '.main.temp')
								temp="Current Temperature: $Temp $degree_sgin C"
								###Body feel temperature
								Body_Temp=$(echo $name | jq -r '.main.feels_like')
								body_temp="Body Feel Temperature: $Body_Temp $degree_sgin C"
								###Max_Min_Temperature
								Max_Temp=$(echo $name | jq -r '.main.temp_max')
								Min_Temp=$(echo $name | jq -r '.main.temp_min')
								max_temp="Max Temperature ????: $Max_Temp $degree_sgin C"
								min_temp="Min Temperature ????: $Min_Temp $degree_sgin C"
								###sunrise and sunset time
								Sunrise=$(echo $name | jq -r '.sys.sunrise')
								rise_time=$(date -r $Sunrise)
								Sunset=$(echo $name | jq -r '.sys.sunset')
								set_time=$(date -r $Sunset)
								sunrise="Sunrise ????: $rise_time"
								sunset="Sunset ????: $set_time"
				else
								echo "The name you provided is NOT worked, please try again!"
								exit
				fi

fi

if [ "$Zip" != "Empty" ]
then
				test_zip_code=$(echo $zip_code | jq -r '.cod')
				if [ "$test_zip_code" = 200 ]
				then
								###location info
								Location=$(echo $zip_code | jq -r '.name')
								Country=$(echo $zip_code | jq -r '.sys.country')
								location="Location: $Location, $Country"
								###weather icon info
								Icon="Weather Icon: $icon"
								###weather description
								Description=$(echo $zip_code | jq -r '.weather[0].description')
								description="Weather Description: $Description"
								###temperature right now
								Temp=$(echo $zip_code | jq -r '.main.temp')
								temp="Current Temperature: $Temp $degree_sgin C"
								###Body feel temperature
								Body_Temp=$(echo $zip_code | jq -r '.main.feels_like')
								body_temp="Body Feel Temperature: $Body_Temp $degree_sgin C"
								###Max_Min_Temperature
								Max_Temp=$(echo $zip_code | jq -r '.main.temp_max')
								Min_Temp=$(echo $zip_code | jq -r '.main.temp_min')
								max_temp="Max Temperature ????: $Max_Temp $degree_sgin C"
								min_temp="Min Temperature ????: $Min_Temp $degree_sgin C"
								###sunrise and sunset time
								Sunrise=$(echo $zip_code | jq -r '.sys.sunrise')
								rise_time=$(date -r $Sunrise)
								Sunset=$(echo $zip_code | jq -r '.sys.sunset')
								set_time=$(date -r $Sunset)
								sunrise="Sunrise ????: $rise_time"
								sunset="Sunset ????: $set_time"
				else
								echo "The zip code you provided is NOT worked, please try again!"
								exit
				fi
fi

if [ "$Id" != "Empty" ]
then
				test_id_address=$(echo $id_address | jq -r '.cod')
				if [ "$test_id_address" = 200 ]
				then
								###location info
								Location=$(echo $id_address | jq -r '.name')
								Country=$(echo $id_address| jq -r '.sys.country')
								location="Location: $Location, $Country"
								###weather icon info
								Icon="Weather Icon: $icon"
								###weather description
								Description=$(echo $id_address | jq -r '.weather[0].description')
								description="Weather Description: $Description"
								###temperature right now
								Temp=$(echo $id_address | jq -r '.main.temp')
								temp="Current Temperature: $Temp $degree_sgin C"
								###Body feel temperature
								Body_Temp=$(echo $id_address | jq -r '.main.feels_like')
								body_temp="Body Feel Temperature: $Body_Temp $degree_sgin C"
								###Max_Min_Temperature
								Max_Temp=$(echo $id_address | jq -r '.main.temp_max')
								Min_Temp=$(echo $id_address | jq -r '.main.temp_min')
								max_temp="Max Temperature ????: $Max_Temp $degree_sgin C"
								min_temp="Min Temperature ????: $Min_Temp $degree_sgin C"
								###sunrise and sunset time
								Sunrise=$(echo $id_address | jq -r '.sys.sunrise')
								rise_time=$(date -r $Sunrise)
								Sunset=$(echo $id_address | jq -r '.sys.sunset')
								set_time=$(date -r $Sunset)
								sunrise="Sunrise ????: $rise_time"
								sunset="Sunset ????: $set_time"
				else
								echo "The city id you provided is NOT worked, please check city id list: http://bulk.openweathermap.org/sample/!"
								exit
				fi
fi 

if [ "$Name" = "Empty" ] && [ "$Zip" = "Empty" ] && [ "$Id" = "Empty" ]
then
				if [ "$test_out_local" = 200 ]
				then
								###location info
								Location=$(echo $out_local | jq -r '.name')
								Country=$(echo $out_local | jq -r '.sys.country')
								location="Location: $Location, $Country"
								###weather icon info
								Icon="Weather Icon: $icon"
								###weather description
								Description=$(echo $out_local | jq -r '.weather[0].description')
								description="Weather Description: $Description"
								###temperature right now
								Temp=$(echo $out_local | jq -r '.main.temp')
								temp="Current Temperature: $Temp $degree_sgin C"
								###Body feel temperature
								Body_Temp=$(echo $out_local | jq -r '.main.feels_like')
								body_temp="Body Feel Temperature: $Body_Temp $degree_sgin C"
								###Max_Min_Temperature
								Max_Temp=$(echo $out_local | jq -r '.main.temp_max')
								Min_Temp=$(echo $out_local | jq -r '.main.temp_min')
								max_temp="Max Temperature ????: $Max_Temp $degree_sgin C"
								min_temp="Min Temperature ????: $Min_Temp $degree_sgin C"
								###sunrise and sunset time
								Sunrise=$(echo $out_local | jq -r '.sys.sunrise')
								rise_time=$(date -r $Sunrise)
								Sunset=$(echo $out_local | jq -r '.sys.sunset')
								set_time=$(date -r $Sunset)
								sunrise="Sunrise ????: $rise_time"
								sunset="Sunset ????: $set_time"
				else
								echo "The Local info is NOT worked, please try to put name or city id manually!"
								exit
				fi
fi 







echo $location
echo $Icon
echo $description
echo $temp
echo $body_temp
echo $max_temp
echo $min_temp
echo $sunrise
echo $sunset







#[  -z "$name" ] && echo "Empty: Yes" || echo "Empty: No"
