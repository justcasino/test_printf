/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   print_pointer.c                                    :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jcasino <justincasino@gmail.com>           +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2017/02/22 04:47:55 by jcasino           #+#    #+#             */
/*   Updated: 2017/03/16 17:41:16 by jcasino          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../includes/ft_printf.h"

void ft_putpnt(t_format *format, t_conversion *conversion, uintmax_t num,
        char pad, int base)
{
    int     num_space;
    char    *str_num;
    int     i;
    int     num_len;

    num_space = 0;
    i = 0;
    num_len = (int)(int_len(num, base) + 2);
    str_num = ft_itoa_base(num, conversion);
    if (conversion->width > (unsigned int)num_len)
        num_space = conversion->width - num_len;
   if (!conversion->flags.left_just)
      print_extra_width(format, conversion, num_space, pad, num_len);
    ft_putstr("0x");
    format->num_writt += 2;
   while (str_num[i])
   {
       write(1, &str_num[i], 1);
       //ft_putchar(str_num[i]);
       i++;
       format->num_writt++;
   } 
   if (conversion->flags.left_just)
       print_extra_width(format, conversion, num_space, pad, num_len);
}

void print_pointer(t_format *format, t_conversion *conversion, void *pointer)
{
    uintmax_t   new_point;
    char        pad;

    pad =' ';
    conversion->specifier = HEX_LOWER;
    new_point = (uintmax_t)pointer;
    ft_putpnt(format, conversion, new_point, pad, 16);
}

