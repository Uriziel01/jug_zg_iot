    wifi.setmode(wifi.SOFTAP)
    wifi.ap.config({ssid="JUG 2015", pwd=""})
    wifi.ap.setip({ip="192.168.1.1",netmask="255.255.255.0",gateway="192.168.1.1"})
    outpin=4
    if srv == nil then
    else
    srv.close(srv)
    end
    srv=net.createServer(net.TCP) srv:listen(80,function(conn)
    conn:on("receive",function(conn,payload)
    print(payload)
    conn:send('HTTP/1.1 200 OK\n\n')
    conn:send('<!DOCTYPE HTML>\n')
    conn:send('<html>\n')
    conn:send('<head><meta  content="text/html; charset=utf-8">\n')
    conn:send('<title>ESP8266 - JUG 2015 - Zielona Góra</title></head>\n')
    conn:send('<body><center><h1>ESP8266 - JUG 2015 - Zielona Góra</h1>\n')
    conn:send('<h3>JUG 2015 - Zielona Góra - ESP8266</h3>\n')
    conn:send('<h1>' .. tmr.time() .. ' seconds</h1><br/>\n')
    conn:send('<h1>' .. node.readvdd33() .. ' mV</h1>\n')
    conn:send('</center></body></html>\n')
    conn:on("sent",function(conn) conn:close() end)
    end)
end)

