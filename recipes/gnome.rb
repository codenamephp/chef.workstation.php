codenamephp_gnome_package 'install gnome gui'

codenamephp_gnome_gsettings 'Set display idle delay' do
  schema CodenamePHP::Gnome::GSettings::SCHEMA_DESKTOP_SESSION
  key CodenamePHP::Gnome::GSettings::KEY_DESKTOP_SESSION_IDLE_DELAY
  value '0'
  users node['users']
end

codenamephp_gnome_keyboard_shortcut 'Terminal' do
  command 'gnome-terminal --maximize'
  binding "#{CodenamePHP::Gnome::GSettings::Keys::CTRL}#{CodenamePHP::Gnome::GSettings::Keys::ALT}t"
  users node['users']
end
