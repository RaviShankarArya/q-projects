module ConfigCenter

  module GeneralValidations

    # xxxx@yyyy.zzz format
    EMAIL_FORMAT_REG_EXP = /\A(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})\z/i

    # xxx-xxx-xxxx format
    MOBILE_FORMAT_REG_EXP = /\A([0-9\(\)\/\+ \-]){3}-([0-9\(\)\/\+ \-]){3}-([0-9\(\)\/\+ \-]){4}\z/i

    # xxx-xxx-xxxx format
    PHONE_FORMAT_REG_EXP = /\A\(([0-9\(\)\/\+ \-]){3}\) ([0-9\(\)\/\+ \-]){3}-([0-9\(\)\/\+ \-]){4}\z/i

    # Generic Name
    # a to z (both upper and lower case), 1 to 9, space, dot(.) and curly brackets "(" & ")" allowed.
    NAME_MIN_LEN = 2
    NAME_MAX_LEN = 256
    NAME_FORMAT_REG_EXP = /\A[a-zA-Z1-9\-\ \(\)\.+]*\z/i

    # User Name
    # Minimum length is 6 by default and maximum length is 32 by default
    # Only characters (both upper and lowercase), numbers, dot(.), underscore (_)
    # No spaces, hyphen or any other special characters are allowed
    USERNAME_MIN_LEN = 6
    USERNAME_MAX_LEN = 128
    USERNAME_FORMAT_REG_EXP = /\A[a-zA-Z0-9\_]*\z/

    # Password
    # should have atleast 1 Character (a to z (both upper and lower case))
    # and 1 Number (1 to 9)
    # and 1 Special Character from (!,@,$,&,*,_)",
    PASSWORD_MIN_LEN = 7
    PASSWORD_MAX_LEN = 256
    PASSWORD_FORMAT_REG_EXP = /\A(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9!@$#&*_\.,;:])/
    # PASSWORD_FORMAT_REG_EXP = /\A(?=.*?[a-z][A-Z])(?=.*?\d)(?=.*?[!@$&*_])/i

  end

  module Defaults

    # the default number of milli seconds for which resource listing pages gets refreshed:
    REFRESH_PAGE_IN_MILLI_SECONDS = 180000

    # It will list 10 items per page unless user request to load more (this is done by passing 'per_page' in url)
    ITEMS_PER_LIST = 10
    # It will override the per_page to 10 (default val - ITEMS_PER_LIST), in case if the user request for more items to load in a single listing page.
    # i.e if user passes per_page=251 (greater than MAX_ITEMS_PER_LIST), system will ignore it and fall back to default no of items to be listed in a page (ITEMS_PER_LIST)
    MAX_ITEMS_PER_LIST = 250

    # Default password to be assigned while mocking a user
    PASSWORD = "Password@1"

    # Other constans should follow here.
    EXCLUDED_JSON_ATTRIBUTES = []

    ##
    def host
      case Rails.env
      when "development"
        'http://localhost:3000'
      when "it"
        'http://it.q-project.qwinixtech.com'
      when "uat"
        'http://uat.q-project.qwinixtech.com'
      when "production"
        'http://q-project.qwinixtech.com'
      else
        'http://localhost:3000'
      end
    end
  end

  module User

    PENDING = "pending"
    APPROVED = "approved"
    BLOCKED = "blocked"
    STATUS_LIST = [PENDING, APPROVED, BLOCKED]

    EXCLUDED_JSON_ATTRIBUTES = [:auth_token, :confirmation_token, :password_digest, :reset_password_token, :unlock_token, :status]

  end

  module Roles

    QDASH_SUPER_ADMIN = "Q-Dash Super Admin"
    QDASH_ADMIN = "Q-Dash Admin"

    SCRUM_MASTER = "Scrum Master"
    PRODUCT_OWNER = "Product Owner"
    STAKEHOLDER = "Stakeholder"
    AGILE_MENTOR = "Agile Mentor"
    SCRUM_TEAM_MEMBER = "Scrum Team Member"

    LIST = [SCRUM_MASTER, PRODUCT_OWNER, STAKEHOLDER, AGILE_MENTOR, SCRUM_TEAM_MEMBER]
    ADMIN_ROLES = [QDASH_SUPER_ADMIN, QDASH_ADMIN]

  end

  module Authentication
    SIGN_IN_URL  = "http://localhost:9001/sign_in"
    SIGN_OUT_URL = "http://localhost:9001/sign_out"
    CLIENT_APP_NAME = "Q-Project"
  end

  module QApps
    QAUTH_URL = "http://localhost:9001"
    QPROJECTS_URL = "http://localhost:9002"
    QTIME_URL = "http://localhost:9003"
    QLEAVES_URL = "http://localhost:9004"
    QMEETING_URL = "http://localhost:9005"
    QASSETS_URL = "http://localhost:9006"

    QMESSAGES_URL = "http://localhost:9008"
    QSECURE_URL = "http://localhost:9007"
    QSERVERS_URL = "http://localhost:9009"
    QRECRUIT_URL = "http://localhost:9010"
    QCAREER_URL = "http://localhost:9011"

  end


end
