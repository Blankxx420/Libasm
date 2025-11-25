NAME        = libasm
NAME_BONUS  = libasm_bonus
NAME_LIB    = libasm.a

NASM        = nasm
NASMFLAGS   = -f elf64
LD          = ld
LDFLAGS     = -o

SRCS_LIB    =   ft_strlen.s \
				ft_strcpy.s \
				ft_strcmp.s \
				ft_write.s \
				ft_read.s \
				ft_strdup.s

SRC_MAIN    = main.s

BONUS_DIR   = bonus
SRCS_LIB_BONUS_FILES = ft_list_size.s \
					   ft_list_push_front.s

SRC_MAIN_BONUS = main_bonus.s

OBJ_DIR     = objects

OBJS_LIB    = $(addprefix $(OBJ_DIR)/, $(SRCS_LIB:.s=.o))
OBJ_MAIN    = $(addprefix $(OBJ_DIR)/, $(SRC_MAIN:.s=.o))

OBJS_LIB_BONUS = $(addprefix $(OBJ_DIR)/, $(SRCS_LIB_BONUS_FILES:.s=.o))
OBJ_MAIN_BONUS = $(addprefix $(OBJ_DIR)/, $(SRC_MAIN_BONUS:.s=.o))

all: $(NAME)

$(NAME): $(NAME_LIB) $(OBJ_MAIN)
	@$(LD) $(LDFLAGS) $(NAME) $(OBJ_MAIN) -L. -lasm
	@echo "✅ Executable $(NAME) created!"

$(NAME_LIB): $(OBJS_LIB)
	@ar rcs $(NAME_LIB) $(OBJS_LIB)
	@echo "📚 Library $(NAME_LIB) created!"

bonus: $(OBJS_LIB) $(OBJS_LIB_BONUS) $(OBJ_MAIN_BONUS)
	@ar rcs $(NAME_LIB) $(OBJS_LIB) $(OBJS_LIB_BONUS)
	@echo "📚 Library $(NAME_LIB) updated with BONUS!"
	@$(LD) $(LDFLAGS) $(NAME_BONUS) $(OBJ_MAIN_BONUS) -L. -lasm
	@echo "🌟 Executable $(NAME_BONUS) created!"

$(OBJ_DIR)/%.o: %.s
	@mkdir -p $(OBJ_DIR)
	$(NASM) $(NASMFLAGS) $< -o $@

$(OBJ_DIR)/%.o: $(BONUS_DIR)/%.s
	@mkdir -p $(OBJ_DIR)
	$(NASM) $(NASMFLAGS) $< -o $@

clean:
	@rm -rf $(OBJ_DIR)
	@echo "🧹 Object files cleaned"

fclean: clean
	@rm -f $(NAME) $(NAME_LIB) $(NAME_BONUS)
	@echo "🗑️  Everything deleted"

re: fclean all

.PHONY: all clean fclean re bonus