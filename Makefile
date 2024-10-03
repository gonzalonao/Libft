# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: glopez-c <glopez-c@student.42malaga.com    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/12/04 14:55:07 by glopez-c          #+#    #+#              #
#    Updated: 2024/10/03 14:00:57 by glopez-c         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

AR = ar rcs

RM = rm -f

CC = gcc
CCFLAGS = -Wall -Wextra -Werror

NAME = libft.a

SRC_PATH = ./sources/
OBJ_PATH = ./objects/

SRC = ft_atoi.c ft_bzero.c ft_calloc.c ft_isalnum.c ft_isalpha.c \
    ft_isascii.c ft_isdigit.c ft_isprint.c ft_itoa.c ft_memchr.c \
    ft_memcmp.c ft_memcpy.c ft_memmove.c ft_memset.c ft_putchar_fd.c \
    ft_putendl_fd.c ft_putnbr_fd.c ft_putstr_fd.c ft_split.c ft_strchr.c \
    ft_strdup.c ft_striteri.c ft_strjoin.c ft_strlcat.c ft_strlcpy.c \
    ft_strlen.c ft_strmapi.c ft_strncmp.c ft_strnstr.c ft_strrchr.c \
    ft_strtrim.c ft_substr.c ft_tolower.c ft_toupper.c
    # ft_printf/ft_printf.c ft_printf/ft_printchar_fd.c ft_printf/ft_printnbr_base_fd.c \
    # ft_printf/ft_printnbr_fd.c ft_printf/ft_printstr_fd.c 
    
BSRC = ft_lstnew_bonus.c ft_lstadd_front_bonus.c ft_lstsize_bonus.c \
    ft_lstlast_bonus.c ft_lstadd_back_bonus.c ft_lstdelone_bonus.c \
    ft_lstclear_bonus.c ft_lstiter_bonus.c ft_lstmap_bonus.c
    
SRCS = $(addprefix $(SRC_PATH), $(SRC))

BSRCS = $(addprefix $(SRC_PATH), $(BSRC))

OBJ = $(SRC:.c=.o)
OBJS = $(addprefix $(OBJ_PATH), $(OBJ))

BOBJ = $(BSRC:.c=.o)
BOBJS = $(addprefix $(OBJ_PATH), $(BOBJ))

INC = -I ./includes/

# Colors
GREEN = \033[0;32m
YELLOW = \033[0;33m
BLUE = \033[0;34m
RED = \033[0;31m
RESET = \033[0m

# Animation
SPINNER = / - \\ |

$(OBJ_PATH)%.o: $(SRC_PATH)%.c
	@mkdir -p $(OBJ_PATH)
	@printf "$(YELLOW)Compiling $<...$(RESET)\n"
	@${CC} ${CCFLAGS} ${INC} -c $< -o $@
	@printf "$(GREEN)Compiled $< successfully!$(RESET)\n"

all:  ${NAME}

$(NAME): ${OBJS}
	@printf "$(BLUE)Creating archive $@...$(RESET)\n"
	@${AR} ${NAME} ${OBJS}
	@printf "$(GREEN)Archive $@ created successfully!$(RESET)\n"

bonus:  ${BOBJS}
	@printf "$(BLUE)Creating bonus archive $@...$(RESET)\n"
	@${AR} ${NAME} ${BOBJS}
	@printf "$(GREEN)Bonus archive $@ created successfully!$(RESET)\n"

clean: 
	@printf "$(RED)Cleaning object files...$(RESET)\n"
	@${RM} ${OBJS} ${BOBJS}
	@printf "$(GREEN)Object files cleaned!$(RESET)\n"

fclean: clean
	@printf "$(RED)Cleaning archive...$(RESET)\n"
	@${RM} ${NAME}
	@printf "$(GREEN)Archive cleaned!$(RESET)\n"

re: fclean all

.PHONY: all clean fclean re bonus