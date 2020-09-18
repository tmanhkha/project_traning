# frozen_string_literal: false

class AlertPresenter < BasePresenter
  attr_accessor :alert, :notice

  def render_header_message
    show_alert_or_notice_if_present
  end

  private

  def show_alert_or_notice_if_present
    return '' if message?

    render partial: 'share/alert',
           locals: { presenter: self, class_for_message_type: class_for_message_type, content: content }
  end

  def message?
    notice.blank? && alert.blank?
  end

  def class_for_message_type
    return 'notice alert alert-success' if notice.present?

    'alert alert-danger' if alert.present?
  end

  def content
    return notice if notice.present?

    alert.presence
  end
end
