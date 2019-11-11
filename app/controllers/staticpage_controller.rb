class StaticpageController < ApplicationController
  def show
    caverage_path = "#{Rails.root}/caverage/"
    file_path = File.expand_path( File.join( "#{caverage_path}" , "#{request.path_info}" ) )

    # railsルート以外のディレクトリやファイルが存在しない場合
    if !file_path.start_with?( "#{caverage_path}" ) || !File.exist?(file_path) || File.directory?(file_path)
      render file: "#{Rails.root}/public/404.html", layout: false, status: 404, content_type: 'text/html'
      return
    end
    
    respond_to do |format|
      #format.js { send_data File.read(file_path), :type => "application/javascript" , #:disposition => "inline" }
      #format.css { send_data File.read(file_path), :type => "text/css" }
      #format.png { send_data File.read(file_path), :type => "image/png", :disposition => #"inline" }
      #format.json { render json:"json" }
      format.html { 
        # render html: File.read(path).html_safe 
        render file: "#{file_path}", layout: false, status: 200
      }
    end

  end


  
end
