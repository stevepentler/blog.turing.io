---
title: Shoulda Matchers: Model Validation Testing with one-liners
date: 2016-01-21 17:43 UTC
tags:
author: Steve Pentler
layout: post
---
Are you sick of writing tests to validate your models, or just gifted with solid one-liners? 
##Check out [Shoulda Matchers](http://matchers.shoulda.io/)!##

Shoulda matchers is a gem that allows developers to simplify validation testing with a new suite of testing methods called matchers. Accordingly, validations can generally be tested in one clean line rather than lengthy, redundant tests. This post highlights use with Rspec in Rails, but covers MiniTest installations and semi-pro tips as well.

First, take a peek at the matchers methods you will use in your testing. Checkout out the [cheatsheet](http://matchers.shoulda.io/) too. 

![Matchers](article_images/shoulda-matchers/matchers.png)

Now for an example. We define our validations in the model. The goal here is to ensure that a Resort Object can not be added to the database unless it meets all of the criteria defined in the validations. Ideally, we want Rails to throw an error if any of the validations aren't met. 
In each model, we define the validations that we want to test. Each Resort Object must have the presence of a name, image_path, trail_map_path, etc. Further, the name, image_path, and trail_map_path must be unique in this scenario. 


![Model Validations](article_images/model_validation.png)

These validations are fantastic if they work, but we want to *verify our verifications* with some tests in the resort_spec.rb (resort_test.rb in MiniTest). Without Shoulda Matchers, we would have to write specific tests for each validation that fulfill all of the criteria except for the validation we want to test. This is cumbersome and violates the DRY principle. Shoulda Matchers allows a uniform, clear, and short format. The following example is an RSpec example, but it's rather **boring** because the tests all pass. All of the validations are fulfilled.

![Model Validation Spec](article_images/model_validation_spec.png)

Now, the main event! We are more interested in what happens to the site when all of the validations are NOT fulfilled. If a Resort Object is created or updated, but doesn't meet these specifications, we want a test to fail and notify you of the missing or incorrect attribute.

Notice that we have a validation for :something_that_doesnt_exist. The test will fail because we are expecting a Resort Object to have this attribute, but it doesn't exist in the schema, nor is this attribute ever associated with the Resort Object. The error is apparent in the failed test in the second image.

![Failing Validation](article_images/missing_validation.png)
![Failing Test Oh No!](article_images/failed_test.png)

Shoot! Now you have your models validations, test validations, and a failing test, but you're still getting an error message like the one below! The reason is that Shoulda Matcher validations expect(RSpec) or should(MiniTest) display an error.

![Failing Test Oh No!](article_images/view_failure.png)

In practice, I prefer to add flashes to display messages during sad path tests. If a new object is being created but doesn't save because it fails a validation, I want a particular error to show up.

First, add flashes to your app/layouts/application.html.erb file somewhere in the body section. The standard is to place these above the <%= yield %> so it catches the users eye when a form or other information if filled out incorrectly.

![Layout Flash Integration](article_images/Flashes.png)

Then add flash messages into your controller when you want them to be displayed. Disclaimer, this is from a different, top secret project.

![Controller Flash Integration](article_images/controller_flash.png)

**Semi-Pro Tip:** Remember to update your strong_params private methods if you start requiring an attribute that wasn't previously part of a form or is new to the schema. I spent about an hour tracing a bug back to the fact that I hadn't updated the permitted attributes.

##Installation 
---
**For RSpec:** 
gem 'shoulda-matchers' 
Place the shoulda-matchers gem in the test environment of your Gemfile. Don't forget to bundle. Then head over to your rails_helper.rb file and insert the following lines of code. Don't forget to add the error flashes in your controllers as you proceed. 

![Configuration](article_images/configuration.png)

**For MiniTest:** 
gem 'shoulda', '~> 3.5' 
gem 'shoulda-matchers', '~> 2.0' 

Place these two gems in the test environment of your Gemfile. MiniTest does not require any additional setup once these two gems are installed and bundled. The functionality is the same, except you will use "should validate..." in place of the "it {is_expected_to validate...}." Don't forget to add the error flashes in your controllers as you proceed.

**Semi-Pro Tip:** If you are using MiniTest, DO NOT put the validations inside of a test. Nest them right under the model or you will get an error along the lines of "undefined method: should." See the example below.

![MiniTest Example](article_images/minitest_example.png)

---
![Steve Pentler](article_images/headshot.jpg)
**Steve Pentler** is part of the 1510 cohort. After supporting the development of an adventure education non-profit [Adventure Forward](https://www.youtube.com/watch?v=l_wLFRsFd7k), he turned to coding. He is infatuated with his current project, [Hire My Tribe](https://safe-brushlands-7972.herokuapp.com/), that connects freelance developers into teams for hire. Checkout out his [GitHub profile](https://github.com/stevepentler) or connect with him on LinkedIn(https://www.linkedin.com/in/steve-pentler-8800aa60)




