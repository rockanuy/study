CXX = g++
CXXFLAGS = -std=c++11 -Wall -Wextra -g
LDFLAGS = 
LDLIBS = 

TARGET = main
# SRCS = main.cpp foo.cpp bar.cpp
SRCS = main.cpp
OBJS = $(SRCS:.cpp=.o)
HDRS = foo.h bar.h

all:	$(TARGET)

$(TARGET):	$(OBJS)
	$(CXX) $(LDFLAGS) $(OBJS) -o $(TARGET) $(LDLIBS)

%.o:	%.cpp	$(HDRS)
	$(CXX) $(CXXFLAGS) -c $< -o $@

.PHONY:	clean
clean:
	rm -f $(TARGET) $(OBJS)

.PHONY: run
run:	$(TARGET)
	./$(TARGET)
