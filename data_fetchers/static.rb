set :static, true
set :public_folder, './GameBoy-Online'

get '/' do
  redirect to('/index.xhtml')
end
