FactoryBot.define do
  factory :device do
    token "SEVhBdbKyGxQEqigkXhYjZ3Ptyijpv4fGK4yV3zLnIHjjcLOCScU8kI15Tu9gjBstMORLdyRPmRdlG8s9lmCS2BNAvM0x9PrbftQZyjhPK0h0ZOOnZgy7G3aJvNzPtmB9VA8r8bkvCkucBjBEuv36hrQwUU6V3QF"
    type 'ios'
    user {User.first || association(:user)}
  end
end
