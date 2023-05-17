# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: wel-safa <wel-safa@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/10 10:42:56 by wel-safa          #+#    #+#              #
#    Updated: 2023/05/17 21:07:06 by wel-safa         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME := libft.a
#SRC := $(wildcard *.c) #needs to be explicitely written
SRC	:= ft_atoi.c ft_isalnum.c ft_isdigit.c ft_memchr.c ft_memmove.c\
	ft_putendl_fd.c ft_split.c ft_striteri.c ft_strlcpy.c ft_strnstr.c\
	ft_substr.c ft_bzero.c ft_isalpha.c ft_isprint.c ft_memcmp.c\
	ft_memset.c ft_putnbr_fd.c ft_strchr.c ft_strjoin.c ft_strlen.c\
	ft_strrchr.c ft_strncmp.c ft_tolower.c ft_calloc.c ft_isascii.c ft_itoa.c\
	ft_memcpy.c ft_putchar_fd.c ft_putstr_fd.c ft_strdup.c ft_strlcat.c\
	ft_strmapi.c ft_strtrim.c  ft_toupper.c
OBJS := ${SRC:.c=.o}

BONUS := ft_lstnew.c ft_lstadd_front.c ft_lstsize.c ft_lstlast.c\
	ft_lstadd_back.c ft_lstdelone.c ft_lstclear.c ft_lstiter.c ft_lstmap.c
BONUS_OBJS := ${BONUS:.c=.o}

CFLAGS := -Wall -Werror -Wextra -g

all: $(NAME) bonus

#below command:
#1) creates object files not executables
#2) create a static library file from object files
#3) write/update an object-file index to the archive

$(NAME): $(OBJS) libft.h
	$(AR) rcs $(NAME) $(OBJS)
	ranlib $(NAME)

clean:
	$(RM) -f $(OBJS) $(BONUS_OBJS)

fclean: clean
	rm -rf $(NAME)

re: fclean all

bonus: $(BONUS_OBJS)
	ar rcs $(NAME) $(BONUS_OBJS)

.PHONY: clean fclean all re
