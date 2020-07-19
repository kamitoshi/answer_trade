class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum grade:{
    p_1: 1, p_2: 2, p_3: 3, p_4: 4, p_5: 5, p_6: 6,
    m_1: 7, m_2: 8, m_3: 9, h_1: 10, h_2: 11, h_3: 12, other: 13
  }

  has_one :educational_background, dependent: :destroy
  has_one :watch_point, dependent: :destroy
  has_one :aspire, dependent: :destroy
  has_many :requests, dependent: :destroy
  has_many :videos, dependent: :nullify
  has_many :comments, dependent: :nullify
  has_many :evaluations, dependent: :nullify
  has_many :tweets, dependent: :nullify
  has_many :reply_tweets, dependent: :nullify
  has_many :tweet_evaluations, dependent: :nullify
  has_many :reply_comments, dependent: :nullify
  has_many :comment_evaluations, dependent: :nullify

  # watchリレーション
  has_many :watches, dependent: :nullify
  has_many :watched_videos, through: :watches, source: "video"

  # followリレーション
  has_many :follows, dependent: :destroy
  has_many :follow_students, through: :follows, source: "follow"
  has_many :followed, class_name: "Follow", foreign_key: "follow_id"
  has_many :followed_students, through: :followed, source: :student

  # communityリレーション
  has_many :student_communities, dependent: :destroy
  has_many :communities, through: :student_communities, source: "community"

  # adminになったコミュニティ
  has_many :communities, dependent: :nullify, foreign_key: "admin_id"

  mount_uploader :image, ImageUploader

  validates :name, presence: true
  validates :grade, presence: true

  def thumnail_image
    if self.image.blank?
      "no_image.png"
    else
      self.image.thumnail.to_s
    end
  end

  def info_image
    if self.image.blank?
      "no_image.png"
    else
      self.image.info.to_s
    end
  end

  def watched?(video)
    self.watches.find_by(video_id: video.id)
  end

  # 引数で渡された生徒をフォローする
  def follow(student)
    unless self == student
      self.follows.find_or_create_by(follow_id: student.id)
    end
  end

  # 引数で渡された生徒のフォローを解除する
  def unfollow(student)
    follow = self.follows.find_by(follow_id: student.id)
    follow.destroy if follow
  end

  # 引数で渡された生徒をフォローしているかを判別する
  def follow?(student)
    self.follow_students.include?(student)
  end

end
