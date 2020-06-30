# Uncomment the next line to define a global platform for your project
platform :ios, '11.0'


### 1. flutter create -t module flutter_lib 创建flutter module
### 3. 增加编译选择项
###"$FLUTTER_ROOT/packages/flutter_tools/bin/xcode_backend.sh" build
###"$FLUTTER_ROOT/packages/flutter_tools/bin/xcode_backend.sh" embed
####勾选 Run script only when installing 否则报错:Command PhaseScriptExecution failed with a nonzero exit code
### 4 .关闭bitcode NO
### 2. flutter模块的路径
flutter_application_path = '../KKProject_flutter/flutter_lib'
load File.join(flutter_application_path, '.ios', 'Flutter', 'podhelper.rb')

target 'KKProject_flutter' do
  # Comment the next line if you don't want to use dynamic frameworks
  # Pods for KKProject_flutter
  use_frameworks!
  ### 5 安装flutter
  install_all_flutter_pods(flutter_application_path)
  
  
    pod 'AFNetworking', '~> 4.0.1'
  
  
  
  target 'KKProject_flutterTests' do
    inherit! :search_paths
    # Pods for testing
  end
  
  target 'KKProject_flutterUITests' do
    # Pods for testing
  end
  
end
