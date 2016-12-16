namespace :db do
  desc "remake database data"
  task remake: :environment do
    if Rails.env.development? || Rails.env.staging?
      ["db:drop", "db:create", "db:migrate", "db:seed"].each do |action|
        Rake::Task[action].invoke
      end

      puts "Creating users"
      10.times do
        Fabricate :user
      end

      puts "Creating admin"
      User.create([
        {name: "Do Gia Dat", user_name: "do.gia.dat",
          email: "do.gia.dat@framgia.com", status: 0, role: 0,
          password: "12345678", password_confirmation: "12345678",
          avatar: File.open(File.join(Rails.root, "app/assets/images/users/do_gia_dat.jpg"))
        }, {name: "Tran Xuan Thang", user_name: "tran.xuan.thang",
          email: "tran.xuan.thang@framgia.com", status: 0, role: 0,
          password: "12345678", password_confirmation: "12345678",
          avatar: File.open(File.join(Rails.root, "app/assets/images/users/tran_xuan_thang.jpg"))
        }, {name: "Nguyen Huu Tien", user_name: "nguyen.huu.tien",
          email: "nguyen.huu.tien@framgia.com", status: 0, role: 0,
          password: "12345678", password_confirmation: "12345678",
          avatar: File.open(File.join(Rails.root, "app/assets/images/users/nguyen_huu_tien.jpg"))
        }])

      puts "Creating Categories"
      ["radio online", "blog của tôi", "blog cuộc sống"].each do |name|
        Fabricate :category, name: name
      end

      ["blog radio", "radio tâm sự", "radio tâm hồn", "radio giải trí", "radio tin tức",
        "radio đọc truyện", "radio theo giọng đọc"].each do |name|
        Fabricate :category, name: name, parent_id: 1
      end

      ["yêu 24/7", "cafe.blog", "thơ blog", "hôm nay nghe gì", "truyện online",
        "blog family", "blogger tiêu biểu"].each do |name|
        Fabricate :category, name: name, parent_id: 2
      end

      ["sống đẹp", "chiêm tinh", "thư giãn"].each do |name|
        Fabricate :category, name: name, parent_id: 3
      end

      (1..20).each do |id|
        Advertisment.create(description: "Description #{id}",
          url: "url #{id}", image: "xe_dap")
      end

      puts "Creating accepted posts"
      9.times do
        Post.create(
          post_type: :normal,
          title: Faker::Hipster.sentence,
          description: Faker::Hipster.sentence,
          content: Faker::Hipster.paragraph,
          status: :accepted,
          category_id: Category.order("rand()").first.id,
          image: File.open(File.join(Rails.root, "app/assets/images/posts/image1.jpg")),
          created_at: (Time.now - rand(Time.now.month).month)
        )
      end

      puts "Creating pending posts"
      9.times do
        Post.create(
          post_type: :normal,
          title: Faker::Hipster.sentence,
          description: Faker::Hipster.sentence,
          content: Faker::Hipster.paragraph,
          status: :pending,
          category_id: Category.order("rand()").first.id,
          image: File.open(File.join(Rails.root, "app/assets/images/posts/image1.jpg")),
          user_id: 1,
          created_at: (Time.now - rand(Time.now.month).month)
        )
      end

      puts "Creating confessions"
      9.times do
        Confession.create(
          content: Faker::Hipster.paragraph,
          created_at: (Time.now - rand(Time.now.month).month),
          status: :accepted
        )
      end

      puts "Creating peding confessions"
      9.times do
        Confession.create content: Faker::Hipster.paragraph, status: :pending
      end

    else
      puts "Can rake db:remake in development & staging environments only"
    end
  end
end
