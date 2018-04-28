module Intrigue
module Entity
class DnsRecord < Intrigue::Model::Entity

  def self.metadata
    {
      :name => "DnsRecord",
      :description => "A Dns Record",
      :user_creatable => true
    }
  end

  def validate_entity
    name =~ /\w.*/ #_dns_regex
  end

  def primary
    false
  end

  def detail_string
    return "" unless details["dns_entries"]
    details["dns_entries"].each.group_by{|k| k["response_type"] }.map{|k,v| "#{k}: #{v.length}"}.join("| ")
  end

end
end
end
