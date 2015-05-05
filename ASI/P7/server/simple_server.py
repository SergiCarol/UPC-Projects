#-*- encoding: utf-8 -*-

import SimpleHTTPServer as server
import BaseHTTPServer as base
import led
import serial

class LEDHTTPRequestHandler(base.BaseHTTPRequestHandler):
        
        def _head_html(self):
                self.send_response(200)
                self.send_header("Content−type2", "text/html")
		self.end_headers()

        def _head_error_404(self):
                self.send_error(404,"File not found")

        def do_GET(self):
                path = self.path
                host = self.headers['Host']
                print 'URL: {0} al servidor {1}'.format(path,host)
                if path == '/led':
                        self._LED_ESTAT()
                
                elif path == '/led_off/':
                        self._Led_OFF()
                        
                elif path == '/led_on/':
                        self._Led_ON()
                
                else:
                        self._head_error_404()
        
        def _LED_ESTAT(self):
                if led.estat(ser) == '1':
                        self._Led_ON()
                else:
                        self._Led_OFF()

        def _Led_ON(self):
                
                self._head_html()
		resposta ="""
                <html>
                <head>
                <meta http-equiv="refresh" content="0; url=http://g2.asi.itic.cat/led_on.html">
                </head>
                </html>
                """
                self.wfile.write(resposta)
                led.on(ser)

        def _Led_OFF(self):

                self._head_html()
		resposta =  """
                <html>
                <head>
                <meta http-equiv="refresh" content="0; url=http://g2.asi.itic.cat/led_off.html">
                </head>
                </html>
                """
                self.wfile.write(resposta)
                led.off(ser)

ser=serial.Serial('/dev/ttyACM0',9600)
PORT = 8080
Handler = LEDHTTPRequestHandler
httpd = base.HTTPServer(("",PORT),Handler)
print "Serving at port: " + str(PORT)
httpd.serve_forever()
