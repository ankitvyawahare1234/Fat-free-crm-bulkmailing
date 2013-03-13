module BmailsHelper

def collectlead
	@mp = params[:id]
	p "----------------------------"
	p @mp
	p "-----------------------------"
Lead.all(:conditions => ["campaign_id = ?", @mp]).collect { |mou| mou.email}
end
end