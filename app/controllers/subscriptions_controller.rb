#
# Контроллер вложенного ресурса подписок
class SubscriptionsController < ApplicationController
  # задаем "родительский" event для подписки
  before_action :set_event, only: [:create, :destroy]

  # задаем подписку, которую юзер хочет удалить
  before_action :set_subscription, only: [:destroy]


  def create
    # болванка для новой подписки
    @new_subscription = @event.subscriptions.build(subscription_params)
    @new_subscription.user = current_user

    if @new_subscription.save
      EventMailer.subscription(@event, @new_subscription).deliver_now
      # если сохранилась успешно, редирект на страницу самого события
      redirect_to @event, notice: I18n.t('controllers.subscription.created')
    else
      # если ошибки — рендерим здесь же шаблон события
      render 'events/show', alert: I18n.t('controllers.subscription.error')
    end
  end

  def destroy
    message = {notice: I18n.t('controllers.subscription.destroyed')}

    if current_user_can_edit?(@subscription)
      @subscription.destroy
    else
      message = {alert: I18n.t('controllers.subscription.error')}
    end

    redirect_to @event, message
  end

  private
  def set_subscription
    @subscription = @event.subscriptions.find(params[:id])
  end

  def set_event
    @event = Event.find(params[:event_id])
  end

  def subscription_params
    # .fetch разрешает в params отсутствие ключа :subscription
    params.fetch(:subscription, {}).permit(:user_email, :user_name)
  end
end
