CC = cc
CFLAGS = -Wall -Wextra -Werror
NAME = libft.a
SRC = ft_bzero.c ft_isalnum.c ft_isalpha.c ft_isascii.c ft_isdigit.c ft_isprint.c ft_memcpy.c ft_memmove.c ft_memset.c ft_strlen.c ft_strlcpy.c ft_strlcat.c ft_toupper.c ft_tolower.c ft_strchr.c ft_strrchr.c ft_strncmp.c ft_memchr.c ft_memcmp.c ft_strnstr.c ft_atoi.c ft_calloc.c ft_strdup.c ft_substr.c ft_strjoin.c ft_strtrim.c ft_split.c ft_itoa.c ft_strmapi.c ft_striteri.c ft_putchar_fd.c ft_putstr_fd.c ft_putendl_fd.c ft_putnbr_fd.c

BONUS = ft_lstadd_front_bonus.c ft_lstsize_bonus.c ft_lstnew_bonus.c ft_lstlast_bonus.c ft_lstadd_back_bonus.c ft_lstdelone_bonus.c ft_lstclear_bonus.c ft_lstmap_bonus.c ft_lstiter_bonus.c

AR = ar rcs
LIB = libft.h
OBJ  = $(SRC:.c=.o)
DEP = $(SRC:.c=.d)
OBJB = $(BONUS:.c=.o)
DEPB = $(BONUS:.c=.d)

all: $(NAME)

$(NAME): $(OBJ)
	$(AR) $(NAME) $(OBJ)

%.o: %.c $(LIB) Makefile 
	$(CC) $(CFLAGS) -MMD -c $< -o $@

clean:
	rm -f $(OBJ) $(OBJB) $(DEP) $(DEPB)

fclean: clean
	rm -f $(NAME)

re: fclean all

bonus: $(NAME) $(OBJB)
	$(AR) $(NAME) $(OBJB)

-include $(OBJ:%.o=%.d)
-include $(OBJB:%.o=%.d)

.PHONY: all clean fclean re bonus