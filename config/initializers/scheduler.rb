require 'rufus-scheduler'

s = Rufus::Scheduler.singleton

s.every '30s' do
  Rails.logger.info 'Performing a speed test'

  output = `speedtest --json`
  json = JSON.parse(output)
  bytes_sent = json['bytes_sent']
  dl_speed = json['download']
  timestamp = json['timestamp']
  bytes_received = json['bytes_received']
  ping = json['ping']
  up_speed = json['upload']
  host = json['server']['host']
  lat = json['server']['lat']
  lon = json['server']['lon']

  Result.create(host: host, lat: lat, lon: lon, upload_speed: up_speed, download_speed: dl_speed,
                bytes_uploaded: bytes_sent, bytes_downloaded: bytes_received, ping_ms: ping,
                timestamp: timestamp)

  Rails.logger.info 'Finished speed test'
end
