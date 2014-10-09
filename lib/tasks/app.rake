namespace :app do 
	desc 'setup the initial db'
	task setup: :environment do 
		Rake::Task['db:reset'].invoke
	end
end