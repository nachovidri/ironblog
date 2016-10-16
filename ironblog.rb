require "pry"

class Blog

	def initialize 
		@list_of_posts = []
	end

	def add_post_to_blog post
		@list_of_posts.push(post)
	end

	def publish_front_page
		order_posts
		print_front_page
	end

	def print_front_page
		@list_of_posts.each do |post|
			puts post.post_title
			puts "**************"
			puts "#{post.post_date}\n\n"
		end
	end

	def order_posts
		# binding.pry
		@list_of_posts.sort! { |post1, post2| post1.post_date <=> post2.post_date }
		# @list_of_posts.sort! { |post| post.post_date }
	end
end



class Post

	attr_accessor :post_title, :post_date, :post_text

	def initialize title, date, text
		@post_title = title
		@post_date = date
		@post_text = text
	end
end


post1 = Post.new "Title1", "20160305", "Text1"
post2 = Post.new "Title2", "20160110", "Text2"
post3 = Post.new "Title3", "20160207", "Text3"

blog1 = Blog.new

blog1.add_post_to_blog post1
blog1.add_post_to_blog post2
blog1.add_post_to_blog post3

blog1.publish_front_page


