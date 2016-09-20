module DevicesHelper

  LARGE_BUTTON_STYLE =

  def display_os device
    Device::OSS[device.operating_system.to_sym]
  end

  def display_users device
    user_hash = Hash[*Device::USERS.flatten(1)]
    users = device.users.reject(&:empty?).map {|user| user_hash[user]}
    users.join(', ')
  end

  def display_purchase_date device
    #device.purchase_date
    device.purchase_date ? device.purchase_date.strftime("%d %b %Y") : nil
  end

  def display_photo device
    p device.photo_file_name
    device.photo_file_name
  end

  def select_brand
    ['Select One'] + Device::BRAND
  end

  def selected_brand device
    device.brand || 'Select One'
  end

  def render_delete_link(device, options = {})
    style_class = "waves-effect waves-teal #{options[:style]}"
    link_to '<i class="material-icons">delete</i>'.html_safe, device,
            method: :delete,
            data: { confirm: 'Are you sure?' },
            class: style_class
  end

  def render_button_link(icon, text, path, options = {})
    style_class = "btn btn-large waves-effect waves-light #{options[:style]}"
    link_to "<i class='material-icons left'>#{icon}</i> #{text}".html_safe,
            path,
            class: style_class
  end

  def render_icon_link(icon, path, options = {})
    link_to "<i class='material-icons'>#{icon}</i>".html_safe, path, class: 'waves-effect waves-teal'
  end

end
