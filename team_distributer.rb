class EnglishPremierLeague
	FILE_PATH = "/home/cybage/english-premier-league.txt"

	GORUPS = ['A','B','C','D']

	attr_accessor :groups, :teams

	def initialize
		@groups = []
		@teams = uk_soccer_championship_data
	end

	def create_championship
		teams.each(&:total_points)
		rank_teams
		top_rank = 1
		last_rank = teams.size
		GORUPS.each do |group_name|
			g = Group.new(group_name, get_teams_for_group(top_rank, last_rank))
			g.rank_teams_in_group
			groups << g
			top_rank += 2
			last_rank -= 2
		end
	end

	def uk_soccer_championship_data
		team_performances = []
		File.open(FILE_PATH, "r") do |data|
			data.each_line do |line|
				if line.split('.')[0].strip.to_i != 0
					team_performance = line.split
					team_performances << Team.new(team_performance[1], team_performance[6], team_performance[7])
				end
			end
		end
		team_performances
	end

	#def cal
	def rank_teams
		sorted_teams = teams.sort_by(&:points)
		sorted_teams.each_with_index {|team,index| team.rank_in_championship = index + 1}
	end

	

	def get_teams_for_group top_rank,last_rank
		teams.select {|team| [top_rank,top_rank+1,last_rank,last_rank-1].include? team.rank_in_championship}
	end

end

class Team
	attr_reader :name, :goal_scored_by_team, :goal_scored_against_team
	attr_accessor :rank_in_championship, :rank_in_group, :points

	def initialize name, goal_scored_by_team, goal_scored_against_team
		@name = name
		@goal_scored_by_team = goal_scored_by_team.to_i
		@goal_scored_against_team = goal_scored_against_team.to_i
	end

	def total_points
		@points = goal_scored_by_team * 3 - goal_scored_against_team * 4
	end
end

class Group
	attr_reader :name, :teams

	def initialize name, teams
		@name, @teams = name, teams
	end

	def rank_teams_in_group
		sorted_teams = teams.sort_by {|team| team.points }
		sorted_teams.each_with_index {|team,index| team.rank_in_group = index + 1}
	end
end



 championship = EnglishPremierLeague.new
championship.create_championship
championship.groups.each do |group|
	puts "Group #{group.name}"
	puts "============="
	group.teams.sort_by(&:rank_in_group).each do |team|
		puts team.name
	end
end
