/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_itoa.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: lbellmas <lbellmas@student.42barcelon      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/09/18 11:54:19 by lbellmas          #+#    #+#             */
/*   Updated: 2024/09/26 16:16:08 by lbellmas         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

static char	*ft_colocar(char *str, long num, int tam)
{
	int	p;

	p = tam - 2;
	while (num > 0)
	{
		str[p] = num % 10 + '0';
		num = num / 10;
		p--;
	}
	str[tam - 1] = '\0';
	return (str);
}

static size_t	ft_contar_tam(long num)
{
	int	count;

	count = 0;
	if (num < 0)
	{
		count++;
		num = -num;
	}
	while (num > 0)
	{
		num = num / 10;
		count++;
	}
	return (count);
}

char	*ft_itoa(int n)
{
	char	*str;
	size_t	tam;
	long	num;

	num = n;
	tam = ft_contar_tam(num) + 1;
	if (num == 0)
	{
		str = (char *)malloc(2 * sizeof(char));
		str[0] = '0';
		str [1] = '\0';
		return (str);
	}
	str = (char *)malloc(tam * sizeof(char));
	if (!str)
		return (NULL);
	if (num < 0)
	{
		str[0] = '-';
		num = -num;
	}
	str = ft_colocar(str, num, tam);
	return (str);
}

/*int	main()
{
	printf("%s", ft_itoa(87354));
	return (0);
}*/