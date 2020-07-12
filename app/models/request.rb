class Request < ApplicationRecord
  belongs_to :student

  enum academic_stage:{
    primary: 0, middle: 1, high: 2
  }

  enum subject:{
    japanese: 0, math: 1, social: 2, sience: 3, english: 4
  }

  enum subject_content:{
    contemporary: 0, classic_literature: 1, chinese_classics: 2,
    arithmetic: 3, mathematics_1: 4, mathematics_a: 5, mathematics_2: 6, mathematics_b: 7, mathematics_3: 8, mathematics_c: 9,
    japanese_history: 10, world_history: 11, geography: 12,
    chemistry: 13, physical: 14, creature: 15
  }

end
