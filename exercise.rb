require "json"
require "net/http"

class Github

	COMMIT_TYPE_SCORES = {"PushEvent" => 5, 
												"PullRequestReviewCommentEvent" => 4,
												"WatchEvent" => 3,
												"CreateEvent" => 2 }

	# Currently hard coding URL as it is for a particular user
	# Instead, we can take user input to make it dynamic
	GIT_URL = "https://github.com/dhh.json"

	def get_commit_score
		uri = URI.parse(GIT_URL)
		http = Net::HTTP.new(uri.host, uri.port)
		http.use_ssl = true
		response = http.request(Net::HTTP::Get.new(uri.request_uri))
		git_json_response = JSON.parse(response.body)

		score = calculate_score git_json_response
		print_score score
	end

	def calculate_score git_json_response
		score = 0
		git_json_response.each do |event|
			score += COMMIT_TYPE_SCORES.has_key?(event['type']) ? COMMIT_TYPE_SCORES[event['type']] : 1
		end
		score
	end

	def print_score score
		puts "DHH's github score is #{score}"
	end

end

Github.new.get_commit_score
