class PagesController < ApplicationController
  skip_before_action :authenticate_request!, only: [:submit_demo_request]

  def submit_demo_request
    DemoMailer.notify(params[:email], params[:name], params[:contact_number], params[:company_name]).deliver_now
		render json: { notice: "Demo request has been received. We'll be in touch sortly!" }, status: 200
  end
end
