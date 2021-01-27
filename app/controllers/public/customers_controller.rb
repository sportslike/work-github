class Public::CustomersController < ApplicationController

  def show
    @customer = Customer.find(current_customer.id)
  end

  def withdrawal
    @customer = current_customer
  end

  def edit
    @customer = Customer.find(current_customer.id)
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:success] = "個人情報を編集しました"
      redirect_to public_customer_path(current_customer.id)
    else
      flash[:danger] = '個人情報の編集に失敗しました'
      render :edit
    end
  end

  def destroy # リソースを使用してルーティングを記述したため、logical_delete　から変更
    customer = Customer.find(params[:id])
    customer.destroy
    flash[:success] = "アカウントを削除しました"
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :telephone_number, :postal_code, :address, :email)
  end

end
