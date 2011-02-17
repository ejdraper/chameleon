widget :geckometer do
  key "x"
  type "geckometer"
  data do
    {
      :value => 23,
      :min => { :value => 10, :label => "Min visitors" },
      :max => { :value => 30, :label => "Max visitors" }
    }
  end
end

