from flask import Flask, jsonify, request
import geoip2.webservice
from os import getcwd


geoip_key = "bmcDuoFdrugLyOs1"
geoip_client = geoip2.webservice.Client(675938,geoip_key, host='geolite.info')
response = None


print (response)

app = Flask(__name__)
def get_ipinfo(ip):
    with geoip_client as client:
         try:
            response_city = client.city(ip).city.names['en']
            print(response)
         except:
            return "Ошибка"
    return response_city



@app.route("/")
def main():
    

    external_ip = request.remote_addr
    ip_info = get_ipinfo('external_ip')
    page_info = external_ip + '<br>' +ip_info
    return page_info, 200


# if __name__ == "__main__":
#     app.run(host="0.0.0.0", port=8080, Debug=True)
