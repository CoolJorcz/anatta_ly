Paperclip::Attachment.default_options[:url] = 'http://anattaly.s3.amazonaws.com/'
puts "*"*5000
puts "We've made it here!"
puts "*"*5000
Paperclip::Attachment.default_options[:path] = '/:class/:attachment/:id_partition/:style/:filename'