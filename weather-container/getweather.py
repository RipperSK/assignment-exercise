import pyowm
import os
apiKey = os.environ["OPENWEATHER_API_KEY"]
cityName = os.environ["CITY_NAME"]

owm = pyowm.OWM(apiKey)  # My apiKey

# Search for current weather in cityName
observation = owm.weather_at_place(cityName)
w = observation.get_weather()

# Get degrees Celsius as a unit of temperature that is agreed upon in the whole world - USA
print "source=openweathermap, city="+cityName+", description="+str(w.get_detailed_status())+", temp="+str(w.get_temperature('celsius')['temp'])+"C ,humidity="+str(w.get_humidity())
