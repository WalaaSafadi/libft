# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: wel-safa <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/10 10:42:56 by wel-safa          #+#    #+#              #
#    Updated: 2023/05/10 12:38:47 by wel-safa         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME := libft.a
SRC := $(wildcard *.c) #needs to be explicitely written

OBJS := ${SRC:.c=.o}

#BONUS := Bonus functions
#BONUS_OBJS := ${BONUS:.c=.o}

CFLAGS := -Wall -Werror -Wextra -g

all: $(NAME) #bonus

#below command:
#1) creates object files not executables
#2) create a static library file from object files
#3) write/update an object-file index to the archive

$(NAME): $(OBJS) libft.h
	$(AR) rcs $(NAME) $(OBJS)
	ranlib $(NAME)

clean:
	$(RM) -f $(OBJS)

fclean: clean
	rm -rf $(NAME)

re: fclean all

#bonus: $(BONUS_OBJS)
#	ar rcs $(NAME) $(BONUS_OBJS)

.PHONY: clean fclean all re
