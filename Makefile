NAME		= webserv

CC			= clang++

CFLAGS		= -Wall -Wextra -Werror -std=c++98

RM			= rm -rf

DIR_SRCS	= srcFiles/

DIR_OBJS	= objs/

DIR_INC		= ./includeFiles/

SRC_FILES	= main.cpp

SRCS		= $(addprefix $(DIR_SRCS), $(SRC_FILES))

OBJS		= $(addprefix $(DIR_OBJS), $(SRC_FILES:.cpp=.o))

HEADER		= -I $(DIR_INC)

all:		$(NAME)

$(DIR_OBJS)%.o: $(DIR_SRCS)%.cpp
			@mkdir -p `dirname $@`
			$(CC) $(CFLAGS) $(HEADER) -c $< -o $@

$(NAME):	$(DIR_OBJS) $(OBJS)
			${CC} $(CFLAGS) $(OBJS) -o $(NAME)

$(DIR_OBJS):
		mkdir $(DIR_OBJS)

clean:
		$(RM) $(DIR_OBJS)

fclean:		clean
		$(RM) $(NAME)

re:		fclean all

.PHONY:     all re clean fclean