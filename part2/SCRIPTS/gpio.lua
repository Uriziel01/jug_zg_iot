wifi.setmode(wifi.STATIONAP)
wifi.sta.config('Pawel&Gosia','605969678')
wifi.sta.connect()

rpin=4
gpin=3
if srv == nil then
else
srv.close(srv)
end
gpio.mode(rpin,gpio.OUTPUT)
gpio.mode(gpin,gpio.OUTPUT)
srv=net.createServer(net.TCP) srv:listen(80,function(conn)
conn:on("receive",function(conn,payload)
print(payload)

if string.find(payload,"red_off") ~= nil then gpio.write(rpin,gpio.LOW) end
if string.find(payload,"red_on") ~= nil then gpio.write(rpin,gpio.HIGH) end
if string.find(payload,"green_off") ~= nil then gpio.write(gpin,gpio.LOW) end
if string.find(payload,"green_on") ~= nil then gpio.write(gpin,gpio.HIGH) end

if string.find(payload,"favicon.ico") == nil then
conn:send('<html>Light settings:<br/><form method="POST" name="smart_house_form" ><p><input type="submit" name="lo" value="red_on" /></p><p><input type="submit" name="lf" value="red_off" /></p>')
conn:send('<p><input type="submit" name="lo" value="green_on" /></p><p><input type="submit" name="lf" value="green_off" /></p></form></body></html>')
end

end)

conn:on("sent",function(conn) conn:close() end)

end)
