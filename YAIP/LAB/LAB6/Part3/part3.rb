# frozen_string_literal: true

def neibr_lambda(absc, ord, lambda_func)
  ord == lambda_func.call(absc)
end

def neibr_block(absc, ord)
  ord == (yield absc)
end
