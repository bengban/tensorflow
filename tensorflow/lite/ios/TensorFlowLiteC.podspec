Pod::Spec.new do |s|
  s.name             = 'FindTensorFlowLiteC'
  s.version          = '2.5.0'
  s.authors          = 'Google Inc.'
  s.license          = { :type => 'Apache' }
  s.homepage         = 'https://github.com/bengban/tensorflow'
#  s.source           = { :http => "https://dl.google.com/dl/cpdc/a09140b298d599e0/TensorFlowLiteC-#{s.version}.tar.gz" }
  s.source           = { :http => "http://rqs4w3g0m.hd-bkt.clouddn.com/TensorFlowLiteC_framework.zip" }
#  blob:https://github.com/180ac02d-4985-4357-b2be-eaecaed76acf
  s.summary          = 'TensorFlow Lite'
  s.description      = <<-DESC

  An internal-only pod containing the TensorFlow Lite C library that the public
  `TensorFlowLiteSwift` and `TensorFlowLiteObjC` pods depend on. This pod is not
  intended to be used directly. Swift developers should use the
  `TensorFlowLiteSwift` pod and Objective-C developers should use the
  `TensorFlowLiteObjC` pod.
                       DESC

  s.ios.deployment_target = '9.0'

  s.module_name = 'FindTensorFlowLiteC'
  s.library = 'c++'
  # Note the `///`, two from the `file://` and one from the `/path`.
  #s.source       = { :http => "file:///path/to/TensorFlowLiteC_framework.zip" }

  s.vendored_frameworks = 'TensorFlowLiteC.framework'

  s.default_subspec = 'Core'

  s.subspec 'Core' do |core|
    core.vendored_frameworks = 'Frameworks/TensorFlowLiteC.framework'
  end

  s.subspec 'CoreML' do |coreml|
    coreml.weak_framework = 'CoreML'
    coreml.dependency 'FindTensorFlowLiteC/Core'
    coreml.vendored_frameworks = 'Frameworks/TensorFlowLiteCCoreML.framework'
  end

  s.subspec 'Metal' do |metal|
    metal.weak_framework = 'Metal'
    metal.dependency 'FindTensorFlowLiteC/Core'
    metal.vendored_frameworks = 'Frameworks/TensorFlowLiteCMetal.framework'
  end
end
