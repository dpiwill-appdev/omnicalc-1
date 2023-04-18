class ApplicationController < ActionController::Base
  def blank_square_form
    render({ :template => "calculation_templates/square_form.html.erb" })
  end

  def calculate_square
    @num = params.fetch("blue").to_f
    @square_or_num = @num * @num

    render({ :template => "calculation_templates/square_results.html.erb" })
  end

  def blank_square_root_form
    render({ :template => "calculation_templates/square_root_form.html.erb" })
  end

  def calculate_square_root
    @num = params[:blue].to_f
    @square_root_of_num = Math.sqrt(@num)

    render(template: "calculation_templates/square_root_reults.html.erb")
  end

  def payment_form
    render({ :template => "calculation_templates/payment_form.html.erb" })
  end

  def calculate_payment
    @apr = params[:apr].to_f / 100 / 12
    @number_of_payments = params[:number_of_years].to_i * 12
    @principal = params[:principal].to_f

    @monthly_payment = (@principal * @apr * (1 + @apr) ** @number_of_payments) / ((1 + @apr) ** @number_of_payments - 1)

    @apr = params[:apr]
    @number_of_years = params[:number_of_years]
    @principal = params[:principal]
    @monthly_payment = "%.2f" % @monthly_payment

    render({ :template => "calculation_templates/payment_results.html.erb" })
  end
end
