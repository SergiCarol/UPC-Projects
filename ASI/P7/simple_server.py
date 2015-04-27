#-*- encoding: utf-8 -*-

import SimpleHTTPServer as server
import BaseHTTPServer as base
import led

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
                if path == '/led_on':
                        self._Led_ON()
                elif path == '/led_off':
                        self._Led_OFF()
                else:
                        self._head_error_404()

        def _Led_ON(self):
                print """
                <!DOCTYPE html>
                <html lang="ca">
                <head>
                <meta http-equiv="refresh" content="0"; url=/led_on.html"/>
                </head>
                </html>
                """
                
                self._head_html()
		resposta = """<html>
<head>
	<title>S'ha ences el led</title>
</head>
<body>
	<p>Bon dia</p>
</body>
</html>
	"""
                self.wfile.write(resposta)
                led.on()

        def _Led_OFF(self):

                print """
                <!DOCTYPE html>
                <html lang="ca">
                <head>
                <meta http-equiv="refresh" content="0"; url=/led_off.html"/>
                </head>
                </html>
                """

                self._head_html()
		resposta = """<html>
<head>
	<title>S'ha ences el led</title>
</head>
<body>
	<p>Bon dia</p>
</body>
</html>
	"""
                self.wfile.write(resposta)
                led.off()



led.setup(18)
PORT = 8000
Handler = LEDHTTPRequestHandler
httpd = base.HTTPServer(("",PORT),Handler)
print "Serving at port: " + str(PORT)
httpd.serve_forever()
