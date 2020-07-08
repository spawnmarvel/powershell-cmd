import http.server
import socketserver

PORT = 8080
Handler = http.server.SimpleHTTPRequestHandler

def simp_http():
    try:
        with socketserver.TCPServer(("", PORT), Handler) as httpd:
            print("serving at port", PORT)
            httpd.serve_forever()
    except KeyboardInterrupt as e:
        print("closing" + str(e))
        httpd.server_close()

if __name__ == '__main__':
    simp_http()

    