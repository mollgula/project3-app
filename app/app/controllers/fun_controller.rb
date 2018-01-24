class FunController < ApplicationController

    def search
            require 'nokogiri'
            require 'open-uri'
            require 'openssl'
            require 'uri'

            @img_box = []
            #tumblerの画像を取得
            @keyword = params[:keyname]
            @tumbler_url = URI.parse URI.encode "https://www.tumblr.com/search/#{@keyword}"
            @doc = Nokogiri::HTML(open(@tumbler_url, :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE).read)
            @no_img = "お探しのキーワードでは画像が見つかりませんでした"
        @doc.xpath("//*[contains(@src, \"https://78.media.tumblr.com/\")]").each do |img|
            @img_box.push(img[:src]).uniq
        end
        render "result"
    end

    def new
        @picture = Picture.new
        @picture.name = "Sample00"
    end

    def storage
        @src = params.require(:src)
        puts @src  # URL
        @picture = Picture.new(@src)
        @picture.name = params[:picture][:picture].original_filename
        @picture.picture = params[:picture][:picture].read

        if @picture.save
            redirect_to root_path
        else
            render 'list'
        end
    end
end