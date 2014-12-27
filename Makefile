all: test_simple test_combinators example_expression test.csv test.exp mkcsv mkexp

debug: CFLAGS+="-DDEBUG"
debug: all

clean:
	rm -f test_combinators test_simple example_expression test.csv mkexp test.exp mkcsv

test_combinators: test_combinators.cpp templateio.hpp parser_combinators.hpp function_traits.hpp profile.hpp stream_iterator.hpp
	clang++ ${CFLAGS} -ggdb -march=native -O3 -flto -std=c++11 -o test_combinators test_combinators.cpp

test_simple: test_simple.cpp templateio.hpp parser_simple.hpp profile.hpp
	clang++ ${CFLAGS} -ggdb -march=native -O3 -flto -std=c++11 -o test_simple test_simple.cpp

example_expression: example_expression.cpp templateio.hpp parser_combinators.hpp function_traits.hpp profile.hpp stream_iterator.hpp
	clang++ ${CFLAGS} -ggdb -march=native -O3 -flto -std=c++11 -o example_expression example_expression.cpp

mkexp: mkexp.cpp
	clang++ ${CFLAGS} -ggdb -march=native -O3 -flto -std=c++11 -o mkexp mkexp.cpp

mkcsv: mkcsv.cpp
	clang++ ${CFLAGS} -ggdb -march=native -O3 -flto -std=c++11 -o mkcsv mkcsv.cpp

test.csv: mkcsv
	./mkcsv > test.csv

test.exp: mkexp
	./mkexp > test.exp
	
