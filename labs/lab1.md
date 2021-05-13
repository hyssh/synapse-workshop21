# Lab 1. Extract data and load it into a table in Dedicated SQL

Download data URL
```
https://github.com/xlegend1024/azlab-flightdelay-02/raw/master/airline_delay_causes_2003_2021.zip
```

Dataflow Derive Transformation expression
```
iif(locate(':', airport_name) > 1 , left(airport_name, locate(':', airport_name) -1), airport_name)

```