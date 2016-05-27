require 'sinatra'
require 'active_record'
require 'open3'

ActiveRecord::Base.establish_connection(
  "adapter" => "sqlite3",
  'database' => './is_there.db'
)

class History < ActiveRecord::Base
end

get '/' do
  @history = History.all.last
  erb :index
end

post '/' do
  # outs = [out, err, status]
  # capture_outs = Open3.capture3("python ./sense_camera.py")   
  capture_outs = []   
  # cv_outs = []
  # if capture_outs[0].include?("YES")
    cv_outs = Open3.capture3("./FaceDetection/FaceDetection") 
  # end
  body_text = capture_outs.join("\n") + "\n\ncpp:" + cv_outs.join("\n")
  History.create({body: body_text, created_at: Time.now})
  redirect '/'
  erb :index
end
