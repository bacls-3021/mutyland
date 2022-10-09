class HomeController < ApplicationController
  def index
    # uri = URI('https://alonhadat.com.vn/handler/Handler.ashx?command=6')
    # login = Net::HTTP.post_form(uri, 'loginname' => 'gindeptrai', 'password' => 'Ketcdlena1@@')
    # url_changepw = URI('https://alonhadat.com.vn/publish/handler/Handler.ashx?command=5')
    # http = Net::HTTP.new(url_changepw.host, url_changepw.port)
    # http.use_ssl = true
    # http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    # request = Net::HTTP::Post.new(url_changepw, 'oldPassword' => 'Ketcdlena1@@', 'newPassword' => 'Anhhuydepzai123')
    # request.add_field('cookie', 'AASP.NET_SessionId=dpee3t55elkcpvzdbpvkamyi; ignoredmember=; _ga=GA1.3.555908177.1663256347; _gid=GA1.3.1471832820.1663513982; loginname=gindeptrai; password=c658101d8bcafb46ab3d52016f4f7e09; remember=on; page_idcc=c6e19e830859f2cb9f7c8f8cacb8d2a6; _gat=1')
    # request.add_field('content-type', 'application/x-www-form-urlencoded; charset=UTF-8')
    # request.add_field('content-length', 56)
    # request.add_field('user-agent', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36')
    # request.add_field('x-requested-with', 'XMLHttpRequest')
    # request['cookie'] = login.header["set-cookie"]
    # response = http.request(request)
    # byebug
  end

  def submit
    AlonhadatCreator.new(params_permit).perform
  end


  def params_permit
    params.require(:post).permit :name, :phone_number, :title, :description, :province
  end
end
