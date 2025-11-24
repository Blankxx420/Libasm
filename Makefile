NAME        = main
NAME_LIB    = libasm.a

NASM        = nasm
NASMFLAGS   = -f elf64

LD          = ld
LDFLAGS     = -o $(NAME)

SRCS_LIB    =	ft_strlen.s \
				ft_strcpy.s

SRC_MAIN    = main.s

OBJ_DIR     = objects
OBJS_LIB    = $(addprefix $(OBJ_DIR)/, $(SRCS_LIB:.s=.o))
OBJ_MAIN    = $(addprefix $(OBJ_DIR)/, $(SRC_MAIN:.s=.o))


all: $(NAME)

$(NAME): $(NAME_LIB) $(OBJ_MAIN)
	@$(LD) $(LDFLAGS) $(OBJ_MAIN) -L. -lasm
	@echo "✅ Executable $(NAME) created!"

$(NAME_LIB): $(OBJS_LIB)
	@ar rcs $(NAME_LIB) $(OBJS_LIB)
	@echo "📚 Library $(NAME_LIB) created!"

$(OBJ_DIR)/%.o: %.s
	@mkdir -p $(OBJ_DIR)
	$(NASM) $(NASMFLAGS) $< -o $@

clean:
	@rm -rf $(OBJ_DIR)
	@echo "🧹 Object files cleaned"

fclean: clean
	@rm -f $(NAME) $(NAME_LIB)
	@echo "🗑️  Everything deleted"

re: fclean all

.PHONY: all clean fclean re