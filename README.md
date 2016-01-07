# Activerecord::Attributes

Just looking at an ActiveRecord class can be cognitively cumbersome. Not only do you have to comprehend all the
scopes, relations, validations, etc, present in the file, but at the same time you have mentally
overlay the database table that it represents in order to get the full picture.

Why should you required to reconcile two related mental models in realtime in order to comprehend your own, or somebody
else's code?

`ActiveRecord::Attributes` is a simple way to annotate and sanity check your record classess so that they can be both
understood and known to be correct.

## Usage

Declare attributes in your record class

        class Artist < ActiveRecord::Base
          attribute :name
          attribute :discipline
        end

Upon loading this class, the attribute declaration will assert that the columns corresponding to `:name` and
`:discipline` do indeed exist and fail fast otherwise.

That's it!

## Migrations

Existential column assertions are all well and good, but in the context of migrations, the columns that back an
active record's attributes could be in flux. For this reason, there is the facility to disable sanity checking:

    ActiveRecord::Attributes.without_assertions do
      Artist.find_by_passion('painting')
    end


## Installation

Add this line to your application's Gemfile:

    gem 'activerecord-attributes'



## Code of Conduct
Please note that this project is released with a Contributor Code of
Conduct. By participating in this project you agree to abide by its
terms, which can be found in the `CODE_OF_CONDUCT.md` file in this
repository.
