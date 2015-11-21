class Article < ActiveRecord::Base
	#la tabla => articles
	#los campos => article.title() => 'El titulo del articulo'
	#escribir metodos

	validates :title, presence: true
	validates :body, presence: true, length: {minimum: 20}


	#validates :username, format: {width: /regex/}
end
