# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jcasino <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/03/12 13:45:11 by jcasino           #+#    #+#              #
#    Updated: 2017/03/20 00:11:20 by jcasino          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME	= libftprintf.a

CFLAGS 	= gcc -Wall -Wextra -Werror

AR = ar rcv

SRC		= ft_itoa_uintmax.c 				\
		  ft_printf.c						\
		  ft_putnbr_just.c					\
		  manage_flags.c					\
		  manage_length.c					\
		  manage_specifier.c				\
		  manage_width_precision.c			\
		  print_int.c						\
		  print_string.c					\
		  ft_itoa_uintmax.c					\
		  print_base.c						\
		  print_helper.c					\
		  print_pointer.c					\
		  ft_memalloc.c						\
		  ft_memset.c						\
		  ft_putchar_fd.c					\
		  ft_putchar.c						\
		  ft_putstr.c						\
		  ft_strnew.c						\
		  ft_strlen.c						\
		  ft_strcpy.c						\
		  ft_isdigit.c						\
		  ft_strdup.c						\
		  print_binary.c



OBJ		= $(addprefix $(OBJDIR),$(SRC:.c=.o))

LIBFT	= ./libft/libft.a

LIBINC	= -I./libft/includes/

LIBLINK = -L./libft -lft

LIBDIR 	= ./libft/

SRCDIR  = ./srcs/

INCDIR	= ./includes/

OBJDIR	= ./obj/

LIBOBJ  = ./libft/obj


# Colors
RESET		=	\033[0m
DARK		=	\033[1;32m
RED			=	\033[31m
GREEN		=	\033[32m
YELLOW		=	\033[33m
BLUE		=	\033[34m
MAGENTA		=	\033[35m
CYAN		=	\033[36m
WHITE		=	\033[37m
BOLDBLACK	=	\033[1m\033[30m
BOLDRED		=	\033[1m\033[31m
BOLDWHITE	=	\033[1m\033[37m

all: obj libft $(NAME)

obj:
	@mkdir -p $(OBJDIR)

$(OBJDIR)%.o:$(SRCDIR)%.c
	@$(CFLAGS) -I $(INCDIR) -o $@ -c $^

$(LIBFT):	$(LIBFT)

$(LIBFT):
	@make -C ./libft

$(NAME): $(OBJ)
	@echo "$(CYAN) Compiling and building library..."
	@echo "$(GREEN) Objects created $(DARK)"
	@$(AR) $@ $^
	@ranlib $@
	@echo " $(RESET)$(CYAN)$(NAME) has been made $(RESET)\n"

clean:
	rm -rf $(OBJDIR)

fclean: clean
	rm -rf $(NAME)
	rm -rf $(LIBFT)
	make fclean -C $(LIBDIR)

re: fclean all
